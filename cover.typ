#import "constants.typ": PROJECT_NAME

#set align(center)
#rect(width: 100%, height: 100%, stroke: 3pt)[
    #rect(width: 100%, height: 100%, stroke: 1pt)[
        #set text(16pt)
        
        #v(1.5cm)
        *ĐẠI HỌC QUỐC GIA HÀ NỘI*  

        *TRƯỜNG ĐẠI HỌC CÔNG NGHỆ*
        
        #v(1cm)
        #image("assets/uet.png", width: 160pt)
        
        #v(1cm)
        #upper([
            *BÁO CÁO CUỐI KÌ MÔN HỌC*  

            *GIA CÔNG VÀ THIẾT KẾ CAD/CAM/CAE*
        ])
        
        #set text(14pt)
        #v(0.5cm)
        *Đề tài:*  
        #PROJECT_NAME
        
        #table(
            columns: (11em, 14em),
            inset: 7pt,
            align: left + horizon,
            stroke: none,

            [*Giảng viên hướng dẫn:*], [TS. Lê Xuân Lực],
            [*Sinh viên thực hiện:*], [Nguyễn Hoàng Tuấn - 24022923 \ Đỗ Minh - 24022889],
            [*Lớp:*], [K69E-RE1],
            [*Mã học phần:*], [RBE3002 1]
        )

        #v(3cm)
        *Hà Nội — 2026*

        #v(1cm)
    ]
]
