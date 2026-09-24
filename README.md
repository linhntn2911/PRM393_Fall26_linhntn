# Flutter Exercises

Project riêng cho năm bài tập của Lab 4, theo cách chia UI/Screen và UI/Widgets của project mẫu.

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

## Bài 3, 4, 5
- Bài 3 (`layout_demo.dart`): Column chia phần, Row hiển thị tiêu đề, Padding/SizedBox tạo khoảng cách 8/16 px, ListView.builder hiển thị phim.
- Bài 4 (`app_structure_demo.dart`): Scaffold, AppBar, body và FAB tăng bộ đếm. Switch Dark thay đổi themeMode giữa ThemeData sáng và tối trong MaterialApp riêng của bài 4. Nút Back trở về menu.
- Bài 5 (`common_ui_errors_demo.dart`): minh họa bốn lỗi và cách sửa ngay trên màn hình.

### Giải thích các lỗi bài 5
1. ListView nằm trực tiếp trong Column không có giới hạn chiều cao: bọc bằng Expanded. Khi phần ví dụ nằm trong vùng cuộn, SizedBox(height: 280) cấp chiều cao hữu hạn cho Column trước khi dùng Expanded.
2. Column chứa nhiều nội dung bị overflow trên màn hình nhỏ: bọc nội dung bằng SingleChildScrollView để cuộn xem các điều khiển.
3. Thay đổi biến nhưng UI không cập nhật: tăng bộ đếm trong setState().
4. DatePicker dùng context nằm ngoài MaterialApp sẽ thiếu Navigator/MaterialLocalizations: gọi showDatePicker từ context của State nằm dưới MaterialApp khi nhấn nút. Kiểm tra mounted sau await và chỉ cập nhật khi date khác null; hủy lịch giữ nguyên ngày.

Chạy `flutter analyze` và `flutter test` để kiểm tra code và các thao tác.
