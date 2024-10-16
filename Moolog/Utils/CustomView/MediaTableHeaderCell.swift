//
//  MediaTableHeaderCell.swift
//  Moolog
//
//  Created by Jisoo Ham on 10/12/24.
//

import UIKit

import SnapKit

final class MediaTableHeaderCell: BaseTableViewCell {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .title
        return label
    }()
    
    override func setLayout() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
                .inset(Constant.Numeric.horiSpacing.value)
            make.verticalEdges.equalToSuperview()
                .inset(Constant.Numeric.vertiSpacing.value)
        }
        
        selectionStyle = .none
        contentView.backgroundColor = .black
    }
    
    func setUI(title: String) {
        titleLabel.text = title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
}
