//
//  NavigationBar.swift
//  MovieList
//
//  Created by Prizega on 21/03/24.
//

import UIKit

protocol NavigationBarDelegate{
    func pressBack()
}

@IBDesignable
class NavigationBar: UIView{
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    var delegate: NavigationBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "NavigationBar") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        btnBack.setTitle("", for: .normal)
        btnBack.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setNavigationBar(_ title: String){
        self.lblTitle.text = title
    }
    
    @objc private func onButtonPressed(_ sender: UIButton){
        self.delegate?.pressBack()
    }

}
