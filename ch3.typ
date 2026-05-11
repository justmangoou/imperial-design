#import "constants.typ": PROJECT_NAME

= PHÂN TÍCH VÀ TỐI ƯU THIẾT kế
    == Chia lưới 
        Để đảm bảo độ chính xác của kết quả mô phỏng và khả năng xử lý của phần mềm, kích thước lưới được chọn với khoảng cách là *19.1 mm*.

        Kết quả chia lưới của chi tiết được thể hiện trong hình sau:

        #figure(
            image("assets/3d-mesh.png", width: 55%),
            caption: [Chia lưới 3D chi tiết]
        )

    == Trạng thái ứng suất (stress)
        #figure(
            image("assets/stress_sim_top_view.png", width: 75%),
            caption: [Kết quả mô phỏng ứng suất (Top view)],
        )
        #linebreak()

        #figure(
            image("assets/stress_sim_bottom_view.png", width: 75%),
            caption: [Kết quả mô phỏng ứng suất (Bottom view)],
        )
        #linebreak()

        - *Giá trị ứng suất Von-Mises lớn nhất:* Ghi nhận được là *8.142 MPa*.
        - *Vùng tập trung ứng suất:* Ứng suất tập trung cao nhất được ghi nhận tại vùng chân cánh quạt (tiếp giáp với đĩa nền) và vùng quanh lỗ tâm của hub.
        - *Kết luận:* Giá trị ứng suất Von-Mises cực đại ghi nhận được là 8.142 MPa. So với giới hạn bền kéo của vật liệu Thép AISI 4340 (Yield Strength 470 - 710 MPa), hệ số an toàn (Fos) đạt mức rất cao (> 50).

    == Phản lực (Reaction Force)
        #figure(
            image("assets/reaction_force_sim_top_view.png", width: 75%),
            caption: [Kết quả mô phỏng phản lực (Top view)],
        )
        #linebreak()

        #figure(
            image("assets/reaction_force_sim_bottom_view.png", width: 75%),
            caption: [Kết quả mô phỏng phản lực (Bottom view)],
        )
        #linebreak()

        - *Vị trí xuất hiện:* Phản lực tập trung chính xác tại bề mặt lỗ trục và các điểm liên kết ở mặt đáy cánh bơm. Đây là vị trí khớp nối trực tiếp với trục máy bơm thông qua mối ghép then hoặc ren.
        - *Ý nghĩa vật lý*: Điều này chứng minh rằng các ngàm cố định (Fixed Constraints) đặt đã hoạt động đúng. Phản lực tại lỗ trục đại diện cho lực chống lại tải trọng ly tâm phát sinh từ tốc độ quay 3000 RPM, đảm bảo chi tiết ở trạng thái cân bằng tĩnh trong hệ quy chiếu quay.

    == Biến dạng (Displacement/Deformation)
        === Hình dạng ban đầu
            #figure(
                image("assets/displacement_original_top_view.png", width: 75%),
                caption: [Hình dạng ban đầu của chi tiết (Top view)],
            )
            #linebreak()

            #figure(
                image("assets/displacement_original_bottom_view.png", width: 75%),
                caption: [Hình dạng ban đầu của chi tiết (Bottom view)],
            )
            #linebreak()

        === Xu hướng biến dạng
            #figure(
                image("assets/displacement_sim_top_view.png", width: 75%),
                caption: [Kết quả mô phỏng biến dạng (Top view)],
            )
            #linebreak()

            #figure(
                image("assets/displacement_sim_bottom_view.png", width: 75%),
                caption: [Kết quả mô phỏng biến dạng (Bottom view)],
            )
            #linebreak()
        
            - *Thông số hiện tại:* Displacement - Nodal, Magnitude.
            - *Giá trị Max (0.00242038 mm):* Độ biến dạng lớn nhất ghi nhận được xấp xỉ 0.0024 mm (tương đương 2.4 micromet).
            - *Vùng màu đỏ:* Tập trung ở phần mép ngoài của đĩa nền  và đỉnh các cánh quạt.
            - *Vùng màu xanh đậm:* Tập trung tại lỗ tâm trục (hub bore).
        
    == Hệ số an toàn và khả năng vận hành
        $ S = sigma_"yield" / sigma_"max" = 710 / 8.142 approx 87.2 $
        - *Hệ số an toàn:* Với hệ số an toàn xấp xỉ 87.2, chi tiết *"#PROJECT_NAME"* đang ở trạng thái cực kỳ an toàn. So với các tiêu chuẩn thiết kế cơ khí thông thường (chỉ yêu cầu $S$ từ $1.5$ – $2.5$), thiết kế này có khả năng chịu tải vượt mức mong đợi."
        - *Vị trí nguy cơ:* Dựa trên biểu đồ nhiệt, các điểm có xu hướng chịu tải cao hơn (dù vẫn trong ngưỡng an toàn) tập trung tại:
        - *Chân cánh quạt:* Nơi chịu ứng suất uốn do lực ly tâm.
        - *Mép lỗ trục:* Nơi chịu phản lực từ ngàm cố định để giữ cân bằng cho toàn bộ hệ thống đang quay ở tốc độ 3000 RPM.

    == Tối ưu hóa 
        - *Giảm khối lượng:* Thực hiện giảm độ dày đĩa nền và vát mỏng dần cánh quạt từ tâm ra rìa để giảm quán tính và lực ly tâm tác động lên hệ thống truyền động.
        - *Thay đổi vật liệu:* Cân nhắc thay thế thép *AISI 4340* bằng các hợp kim nhẹ hơn như *Nhôm 6061-T6* hoặc *7075-T6*. Với ứng suất cực đại chỉ 8.142 MPa, các hợp kim nhôm vẫn đảm bảo hệ số an toàn lý tưởng ($S > 10$) trong khi trọng lượng chi tiết giảm đi khoảng 3 lần.
        - *Tối ưu hóa thủy lực:* Tăng bán kính góc lượn (fillet) tại chân cánh để giảm thiểu tập trung ứng suất cục bộ và tối ưu hóa dòng chảy của chất lỏng qua cánh bơm.
        