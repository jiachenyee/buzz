import CoreHaptics
import OSLog

@available(iOS 13.0, *)
public class BuzzManager {
    let engine: CHHapticEngine
    
    init?() {
        do {
            engine = try CHHapticEngine()
        } catch {
            if #available(iOS 14, *) {
                os_log(.error, "Could not start haptic engine: \(error.localizedDescription)")
            } else {
                print("Could not start haptic engine: \(error.localizedDescription)")
            }
            return nil
        }
    }
    
    public static let shared = BuzzManager()
}
