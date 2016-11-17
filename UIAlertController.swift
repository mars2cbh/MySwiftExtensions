//
//  UIAlertController.swift
//  aboutyeogi3
//
//  Created by David Choi on 2016. 11. 17..
//  Copyright © 2016년 WithInnovation. All rights reserved.
//

import UIKit
import Foundation

extension UIAlertController {
    
    func getCancelIndex() -> Int {
        return 999
    }
    
    convenience init(actionStrings:[String], cancel:String?, handler: ((_ controllere:UIAlertController, _ index:Int) -> Swift.Void)? = nil) {
        
        self.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for i in 0..<actionStrings.count {

            let action = UIAlertAction(title: actionStrings[i], style: .default) { action in
                
                if let h = handler {
                    h(self, i)
                }
                
                self.dismiss(animated: true, completion: nil)
                
            }

             self.addAction(action)
            
        }
        
        if let c = cancel {
            
            let action = UIAlertAction(title: c, style: .cancel) { action in
                
                if let h = handler {
                    h(self, self.getCancelIndex())
                }
                
                self.dismiss(animated: true, completion: nil)
                
            }
            
            self.addAction(action)
        }
        
    }
    
}
