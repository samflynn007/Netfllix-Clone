//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by Venky on 07/09/23.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with models: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(models)") else {
            return
        }
        
        posterImageView.sd_setImage(with: url, completed: nil)
        
    }
}
