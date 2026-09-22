# Flutter Exercises

Project riêng cho hai bài tập, theo cách chia UI/Screen và UI/Widgets của project mẫu.

## Chạy
Mở thư mục này bằng Android Studio hoặc VS Code, rồi chạy:

flutter pub get
flutter run

## Code
- lib/main.dart: khởi động ứng dụng.
- lib/UI/Screen/ExerciseHomepage.dart: chọn bài tập.
- lib/UI/Screen/core_widgets_demo.dart: màn hình bài 1.
- lib/UI/Widgets/CoreWidgetsBody.dart: Text, Icon, Image.network, Card và ListTile.
- lib/UI/Screen/input_controls_demo.dart: StatefulWidget với Slider, Switch, RadioListTile và DatePicker; cập nhật bằng setState.

Bài 1 cần Internet để tải ảnh. Bài 2 hiển thị các giá trị sau khi thay đổi và giữ nguyên ngày khi hủy lịch.

## Kiểm thử
flutter test
