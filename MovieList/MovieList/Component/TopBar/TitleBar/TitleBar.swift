//
//  TitleBar.swift
//  MovieList
//
//  Created by MAYU on 21/03/24.
//

import UIKit

class TitleBar: UIView {
    @IBOutlet weak var lblTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

extension TitleBar{
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "TitleBarView") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    
    func setNavigationBar(_ title: String){
        self.lblTitle.text = title
    }
}
