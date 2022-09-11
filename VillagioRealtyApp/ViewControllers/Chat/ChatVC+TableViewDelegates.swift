//  Created by Daniyar Mamadov on 08.09.2022.

import UIKit

extension ChatViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else { return UITableViewCell() }
        let isMyMessage = messages[indexPath.row].sender == "Buyer" ? true : false
        cell.configureCell(message: messages[indexPath.row].message, isMyMessage: isMyMessage)
        return cell
    }
}
