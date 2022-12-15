
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!

        var timer: Timer?
   // Một trình định dạng chuyển đổi giữa các ngày và các văn bản đại diện của chúng.
        let dateFormatter = DateFormatter()
       // chuyển đổi thành 1 chuỗi data()
        @objc func updateTime() {
            timeLabel?.text = dateFormatter.string(from: Date())
        }

        override func viewDidLoad() {
            // Định dạng chuỗi date được người nhận sử dụng.
            dateFormatter.dateFormat = "hh:mm:ss"
            updateTime()
            print("Hello World")
            
        }

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        // Tạo một bộ đếm thời gian và lên lịch cho nó trên vòng lặp chạy hiện tại ở chế độ mặc định.
        // timeInterval : Số giây giữa các lần kích hoạt bộ hẹn giờ
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        print("Hello World Hello World")
        }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        // Dừng bộ đếm thời gian không bao giờ kích hoạt lại và yêu cầu loại bỏ bộ đếm thời gian khỏi vòng lặp chạy của nó.
            timer?.invalidate()
        print("Hello World ,Hello World Hello World, Hello World")
        }


}

