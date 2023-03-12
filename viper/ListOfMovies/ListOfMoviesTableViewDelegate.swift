//
//  ListOfMoviesTableViewDelegate.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit

class ListOfMoviesTableViewDelegate:NSObject, UITableViewDelegate {

    var didTapOnCell: ((Int) -> Void)?

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
