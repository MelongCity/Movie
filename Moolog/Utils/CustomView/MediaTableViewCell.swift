//
//  MediaTableViewCell.swift
//  Moolog
//
//  Created by Jisoo Ham on 10/11/24.
//

import UIKit

import Kingfisher
import RxSwift
import SnapKit

final class MediaTableViewCell: BaseTableViewCell {
    var disposeBag = DisposeBag()
    
    private lazy var posterView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var mediaTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .body1
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override func setLayout() {
        [
            posterView,
            mediaTitleLabel
        ]
            .forEach { contentView.addSubview($0) }
        
        posterView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.verticalEdges.equalToSuperview()
                .inset(Constant.Numeric.vertiSpacing.value)
            make.leading.equalToSuperview().inset(Constant.Numeric.horiSpacing.value)
            make.width.equalTo(posterView.snp.height).multipliedBy(1.25)
        }
        
        mediaTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(posterView.snp.trailing)
                .inset(Constant.Numeric.vertiSpacing.value) // img를 기준으로 12만큼
            make.trailing.equalToSuperview().inset(Constant.Numeric.vertiSpacing.value)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configureUI(posterImg: String, mediaTitle: String) {
        posterView.kf.setImage(with: URL(string: posterImg))
        mediaTitleLabel.text = mediaTitle
    }
}
