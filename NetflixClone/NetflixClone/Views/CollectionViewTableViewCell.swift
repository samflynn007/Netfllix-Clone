//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Venky on 06/09/23.
//

import UIKit

protocol CollectionTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewModel)
}

class CollectionViewTableViewCell: UITableViewCell {
 
    static let identifier = "CollectionViewTableViewCell"
    private var titles: [Title] = []
    weak var delegate: CollectionTableViewCellDelegate?
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    public func configure(with titles: [Title]) {
        self.titles = titles
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    private func downloadTitleAt(_ indexPath: IndexPath) {
       
        DataPersistenceManager.shared.downloadTitleWith(model: titles[indexPath.row]) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        guard let model = titles[indexPath.row].poster_path else { return UICollectionViewCell() }
        let url = "\(model)"
        cell.configure(with: url)
        cell.backgroundColor = .cyan
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        guard let titleName = title.original_title ?? title.original_name else {
            return
        }
        
        ApiCaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
            
            switch result {
            case .success(let videoElement):
                guard let overView = title.overview else { return }
                guard let strongSelf = self else { return }
                let viewModel = TitlePreviewModel(title:  titleName, youtubeVideo: videoElement, titleOverview: overView)
                
                strongSelf.delegate?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            let downloadAction = UIAction(title: "Download",subtitle: nil,image: nil, identifier: nil ,discoverabilityTitle: nil ,state: .off) { _ in
                self?.downloadTitleAt(indexPath)
            }
            return UIMenu(title: "",image: nil,identifier: nil,options: .displayInline, children: [downloadAction])
        }
        return config
    }
    
    
    
    
}
