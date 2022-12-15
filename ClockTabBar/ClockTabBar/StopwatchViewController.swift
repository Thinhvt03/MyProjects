//
// Data : Một bộ đệm byte trong bộ nhớ. cho phép các bộ đệm byte đơn giản đảm nhận hành vi của các đối tượng Foundation

import UIKit

class StopwatchViewController: UIViewController {

    @IBOutlet weak var elapsedTimeLabel: UILabel!
     // // Một trình định dạng chuyển đổi giữa các ngày và các văn bản đại diện của chúng.
        let dateFormatter = DateFormatter()
     // Một giá trị luôn được chỉ định bằng giây
        var elapsedTimeAtStop: TimeInterval = 0
    // thời điểm bắt đầu
        var dateAtStart: Date?    // Data : Một bộ đệm byte trong bộ nhớ. cho phép các bộ đệm byte đơn giản đảm nhận hành vi của các đối tượng Foundation
    
    // Một đối tượng timer sẽ chờ 1 khoảng thời gian được xác định trước. Cho tới thời điểm đó, nó sẽ bắn một message tới target object mà nó liên kết (associated).
        var timer: Timer?

        override func viewDidLoad() {
           // kiểu định dạng thời gian
            dateFormatter.dateFormat = "mm:ss.SS"
            // múi giờ cho người nhận . UTC : Múi giờ chuẩn quốc tế
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            updateElapsedTime()
        }

       @objc func updateElapsedTime() {
            elapsedTimeLabel?.text = dateFormatter.string(from: dateForFormatter() as Date)
        }

        private func dateForFormatter() -> Date {
            if self.dateAtStart != nil {
                // Trả về khoảng thời gian giữa data này và một data đã cho khác.
                let intervalSinceStart = Date().timeIntervalSince(dateAtStart!)
                let totalElapsedTime = elapsedTimeAtStop + intervalSinceStart
                // Khoảng thời gian giữa 00:00:00 UTC ngày 1 tháng 1 năm 2001 và ngày giờ hiện tại. ( time hiện tại là : otalElapsedTime )
                return Date(timeIntervalSince1970: totalElapsedTime)
            }
           // Khoảng thời gian giữa 00:00:00 UTC ngày 1 tháng 1 năm 2001 và ngày giờ hiện tại.
            return Date(timeIntervalSince1970: elapsedTimeAtStop)
        }

        @IBAction func startButtonTapped(sender: AnyObject) {
            if dateAtStart == nil {
                dateAtStart = Date()
                timer = Timer.scheduledTimer(timeInterval: 1.0/20.0, target: self, selector: #selector(self.updateElapsedTime), userInfo: nil, repeats: true)
              print("chung ta")
            }
        }

        @IBAction func stopButtonTapped(sender: AnyObject) {
            if let startDate = dateAtStart { // stop
                // trả về khoảng thời gian kể từ khi bắt đầu đến hiện tại
                elapsedTimeAtStop += Date().timeIntervalSince(startDate as Date)
            } else { // reset
                elapsedTimeAtStop = 0
            }
        // Dừng bộ đếm thời gian lại và yêu cầu loại bỏ bộ đếm thời gian khỏi vòng lặp chạy của nó.
            timer?.invalidate()
            timer = nil           // timer trống
            dateAtStart = nil     // trống
            updateElapsedTime()   // trở về ban đầu
        }
}
