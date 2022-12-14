USE [CourseOnline]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/1/2022 11:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[CourseCategoryId] [int] NOT NULL,
	[UserCreated] [nvarchar](50) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NULL,
	[isActivate] [bit] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 11/1/2022 11:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/1/2022 11:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[isActivate] [bit] NULL,
	[isAdmin] [bit] NOT NULL,
	[isAuthor] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 11/1/2022 11:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[username] [nvarchar](50) NOT NULL,
	[courseId] [int] NOT NULL,
 CONSTRAINT [PK_User_Course] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Title], [DateCreated], [Summary], [CourseCategoryId], [UserCreated], [Info], [image], [isActivate]) VALUES (2, N'Phải thế chứ ♥️', CAST(N'2022-10-25T00:00:00.000' AS DateTime), N'MỚI ĐI LÀM MÀ SUỐT NGÀY PHẢI ĐI DỌN VỆ SINH THÌ PHẢI LÀM SAO BÂY GIỜ :((', 1, N'admin', N'<p>Em qua chỗ này làm đã được 3 tháng rồi, trước đây thì không nhưng mà bây giờ mỗi sáng đến làm em phải lau</p><p>&nbsp;tất cả các bàn, lau nhà bao gồm văn phòng công ty và cửa sau của lối ra vào, em không phải không làm đâu</p><p>&nbsp;nhưng mà em hơi bất ngờ ấy vì trước giờ đi làm chưa sếp nào bảo em lau nhà cả.</p><p>Nói qua về công ty thì công ty này chỉ có một mình em làm thôi, kế toán thuê ngoài, mấy tháng trước có gọi&nbsp;</p><p>cô lao công đến lau dọn nhà 350K/1 lần giờ không thấy gọi nữa mà bảo em làm. Chưa kể công ty nếu gửi hàng gì&nbsp;</p><p>mà ở bán kính quanh công ty 15km sếp cũng bảo em chạy xe máy đi trong khi tiền lương ko phụ cấp tiền xăng,&nbsp;</p><p>thỉnh thoảnh ông ấy còn lấy xe của em đi nữa kìa.</p><p>Giờ em đang bị loay hoay với cái suy nghĩa là thôi chuyện nhỏ mà cứ làm đi với hai là mình đến đây để làm việc&nbsp;</p><p>chứ không phải dọn dẹp như thế này, kính mong được các anh chị tư vấn giúp em ạ ( Em qua đây làm là có người</p><p>&nbsp;quen giới thiệu ạ, lúc đầu nói chuyện không vấn đề gì nhưng sau khi làm việc cùng nhau thì mới phát sinh ạ )</p><p>Member chia sẻ trong Phòng Thú Tội - BEATVN</p><p><a href="https://www.facebook.com/hashtag/beatvn?__eep__=6&amp;__cft__[0]=AZX4qjdHMbCkqk4oOg66NqTi-kk46Vi6hz_zuobOd2i-5ed5N29yoXQhDMbrk1BSGFw1UQ8Vt9nqZIkpvmTalygKk6mlXXcgyiSlNDJuG7lnrZIestDu-RoQojA18alGlfgbfiX1LxNK7AGL4iQ3RvXKXmivzGqALn7MYzh_gl_afAe5Ib2jdtFljRd9aJEXYz0&amp;__tn__=*NK-R">#beatvn</a></p>', N'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80', 0)
INSERT [dbo].[Course] ([Id], [Title], [DateCreated], [Summary], [CourseCategoryId], [UserCreated], [Info], [image], [isActivate]) VALUES (8, N'Góc bức xúc', CAST(N'2022-10-25T23:41:10.290' AS DateTime), N'Có một kiểu người rõ ràng là rất muốn yêu đương nhưng không thấy ai khiến bản thân có hứng thú.', 2, N'admin', N'<p>Bạn nói ăn mặc hở hang ra vào KTX NAM ??? Bộ bạn ngồi canh ở đây 24/24 hay gì mà rành quá vậy? Hay bạn là người ở trong căn này? Dù bạn ở đâu cũng được mong bạn có thể ra nói chuyện cho rõ. Người ta mặc đồ sao thì kệ người ta đi bạn ơi, người ta đi ra ngoài, đi chơi thì không cho ăn diện,không cho MAKE UP hả ta? Đâu phải lúc nào bạn cũng trực ngay cửa sao bạn biết cứ khi ăn mặc đẹp xíu là lại qua ngồi ở đây chơi, người ta đợi bạn rồi đi chơi không được sao ta.</p><p>Còn mấy bạn K18 mới lên bạn nói “mặc đồ như đi karaoke, diện VÁY BODY MAKEUP LỒNG LỘN như mấy chị làm đ ê m” là bạn muốn chửi lên đầu người ta rồi chứ gì mà góp ý khắc phục. Mấy em nó theo nhận xét của tui là nó ăn mặc rất giản dị đơn sơ nhé bạn )) vì là có làm ổn thật nên bảo vệ có qua kiểm tra vài lần nên bạn nào thắc mắc mấy bạn ở dưới sảnh mặc đồ sao thì mấy bạn cứ lại hỏi đi xem bác ấy nói sao. Bạn đăng bài người ta vào “giải thích” thì bị bạn nói là “tẩy trắng”. Ừ thì bạn nói ăn mặc sexy thì người ta nói chỉ có bữa đi coi MONO thì mặc la có gì sai hả ta? “đâu bữa nào nói t coi” là muốn bạn nói có sách mách có chứng, chứ không phải méc nhiều lần mà người ta không có nên tức quá bốc phốt hả?</p><p>Còn về việc bắt người khác xóa bình luận thì tự coi lại bài phốt của bạn nhé, CÓ CMT ở dưới đó, nói chuyện rất đàng hoàng chỉ muốn biết bạn là ai để nói chuyện cho rõ thôi để chuyện đi ngày càng xa. Chúng tôi biết là mình chưa lớn hơn ai nhưng ở đây mấy năm chưa có tình trạng như vậy xảy ra )) còn việc rớt môn thì có liên quan gì trong chuyện này mà bạn đem dô nói ta? Người ta học không được thì chuyển ngành, rớt môn thôi, biết bao nhiêu sinh viên trường này rớt môn bạn rang mà học đi để nghiệp quật đó, tới lúc đó rớt môn lại báo cha báo mẹ. Người ta không xin lỗi bạn thì bạn nói người ta rớt môn ở lại cả năm “thì có quyền gì làm như ông bà chủ” ủa xin lỗi gì, bạn phốt sai thì người ta muốn tìm để nói rõ để giải thích thì cứ XỒN XỒN XÁCH CÁI “MỒM” LÊN ĐÂY NÓI.</p><p>Bạn nói người ta đi qua đi lại thấy? OK nhất bạn rồi, bạn có chắc DORM bạn hay thậm chí là phòng của bạn không có nam nữ ra vào? Hay bạn không makeup này kia? Còn giải thích sao thì người ta nhắn hỏi thì nói đ e d ọ a. Còn bạn nói người ta hóng sai trong khi bạn lại là người không đọc cmt cho kĩ dô bạn ơi, mở con mắt lên đọc đi nè ý của người ta là người ta có diện đồ đẹp hay makeup là đi từ đầu tới cuối dãy cho người ta biết mình đẹp. Miệng nói không đ ả k í c h một ai ăn mặc thế nào mà chửi người ta hơn con ** nữa, cái này ai đọc vào cũng thấy đầu tiên hết á. Khắc phục tình trạng ồn ào gái trai?</p><p>Xin lỗi, nếu không khắc phục thì tới giờ đã làm ầm lên rồi, 3-4 ngày nay ai làm ồn gì tới bạn nữa mà bạn lại lên phốt tiếp. Tưởng chuyện chỉ có vậy mà bạn đẩy xa quá. Vì thấy là làm sai nên chúng tôi mới im lặng thôi chứ không đợi bạn lên phốt đâu. Còn bạn muốn đi xa nữa thì “DORM NAM CUỐI DÃY KTX” sẽ bơi xuồng theo bạn ra</p>', N'https://mega.com.vn/media/news/0406_anh-gai-xinh-30.jpg', 1)
INSERT [dbo].[Course] ([Id], [Title], [DateCreated], [Summary], [CourseCategoryId], [UserCreated], [Info], [image], [isActivate]) VALUES (9, N'[oZe] CẨM NANG THỰC TẬP', CAST(N'2022-10-25T23:47:00.840' AS DateTime), N'Luôn có một "luật bất thành văn" kéo dài từ CKTG Mùa 3 (2013) đến nay: Tất cả các đội vô địch Chung kết Thế giới đều có đường giữa mang quốc tịch Hàn Quốc.', 1, N'admin', N'<p>[oZe] CẨM NANG THỰC TẬP</p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/t52/1.5/16/1f48e.png" alt="💎"></figure><p>Sau những ngày tháng ấp ủ chúng mình-oZe team đã hoàn thành xong cuốn handbook mang tên " Cẩm nang thực tập" với mục đích:</p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/t86/1.5/16/1f4cd.png" alt="📍"></figure><p>Giúp các bạn sinh viên chưa đi thực tập có được những thông tin cần thiết và bổ ích để áp dụng.</p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/t86/1.5/16/1f4cd.png" alt="📍"></figure><p>Hơn nữa là những lời khuyên bổ ích để giúp bạn "thông não" các vấn đề đau đầu của kì thực tập .</p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/te0/1.5/16/1f340.png" alt="🍀"></figure><p>Link đọc: <a href="https://online.flippingbook.com/view/326675012/?fbclid=IwAR3ov-1seF3KvCjD3DVZ8UVsQBjAwkxGLLtisZ6Qo6I3HpalJTpsUxeIjBA">https://online.flippingbook.com/view/326675012/</a></p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/t52/1.5/16/1f48e.png" alt="💎"></figure><p>Chúng mình hy vọng cuốn sách của bộ môn SSB201 này sẽ trở thành một người bạn đồng hành giúp cậu được phần nào trong kì thực tập sắp tới.</p><figure class="image"><img src="https://static.xx.fbcdn.net/images/emoji.php/v9/t52/1.5/16/1f48e.png" alt="💎"></figure><p>Không có gì là không thể, oZe team chúc các bạn sắp tới sẽ có một kì thực tập thành công nhé !</p><p><a href="https://www.facebook.com/hashtag/ozeteam?__eep__=6&amp;__cft__[0]=AZXxseDTKPSqMHH9fCWZ4_d1aiE-sYruknAUrsCFkfqdr1Uf8wSpdjGjArTK_t_GBY4DfiwY8GS8QYLKtw3RlUBxy0iIt8JOOiXU6Sa9bCiY5FnXeMkwcrXjWhMXgsCum2Nh5ptjDaOirbaw0b_LaQJj3l-7SWKOCiHS_n0SmBRD7-WjcBq7BMcaYWPd5J81K8c&amp;__tn__=*NK-R">#oZeteam</a></p><p><a href="https://www.facebook.com/hashtag/camnangthuctap?__eep__=6&amp;__cft__[0]=AZXxseDTKPSqMHH9fCWZ4_d1aiE-sYruknAUrsCFkfqdr1Uf8wSpdjGjArTK_t_GBY4DfiwY8GS8QYLKtw3RlUBxy0iIt8JOOiXU6Sa9bCiY5FnXeMkwcrXjWhMXgsCum2Nh5ptjDaOirbaw0b_LaQJj3l-7SWKOCiHS_n0SmBRD7-WjcBq7BMcaYWPd5J81K8c&amp;__tn__=*NK-R">#Camnangthuctap</a></p><p><a href="https://www.facebook.com/hashtag/ssb201?__eep__=6&amp;__cft__[0]=AZXxseDTKPSqMHH9fCWZ4_d1aiE-sYruknAUrsCFkfqdr1Uf8wSpdjGjArTK_t_GBY4DfiwY8GS8QYLKtw3RlUBxy0iIt8JOOiXU6Sa9bCiY5FnXeMkwcrXjWhMXgsCum2Nh5ptjDaOirbaw0b_LaQJj3l-7SWKOCiHS_n0SmBRD7-WjcBq7BMcaYWPd5J81K8c&amp;__tn__=*NK-R">#SSB201</a></p><p><a href="https://www.facebook.com/hashtag/thuctap?__eep__=6&amp;__cft__[0]=AZXxseDTKPSqMHH9fCWZ4_d1aiE-sYruknAUrsCFkfqdr1Uf8wSpdjGjArTK_t_GBY4DfiwY8GS8QYLKtw3RlUBxy0iIt8JOOiXU6Sa9bCiY5FnXeMkwcrXjWhMXgsCum2Nh5ptjDaOirbaw0b_LaQJj3l-7SWKOCiHS_n0SmBRD7-WjcBq7BMcaYWPd5J81K8c&amp;__tn__=*NK-R">#thuctap</a></p>', N'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=710&q=80', 1)
INSERT [dbo].[Course] ([Id], [Title], [DateCreated], [Summary], [CourseCategoryId], [UserCreated], [Info], [image], [isActivate]) VALUES (10, N'15 ĐIỀU CHỈ SINH VIÊN XA NHÀ MỚI HIỂU', CAST(N'2022-10-26T20:24:16.940' AS DateTime), N'123       ', 1, N'admin', N'<p>1. Thấy biển số xe quê mình cũng cảm thấy thân thiết.</p><p>2. Không dám trở mặt với bạn cùng phòng vì sẽ không biết đi đâu về đâu.</p><p>3. Tan học và về nhà trở thành 2 khái niệm tách rời.</p><p>4. Cơm ăn không quen nhưng vẫn béo.</p><p>5. "Sắp tới nghỉ lễ mày có về không?" "Không về được, nhà tao xa lắm".</p><p>6. Trên điện thoại có 2 phần dự báo thời tiết, một là thành phố đang học, hai là quê nhà.</p><p>7. Mỗi lần mua vé tàu xe về quê nghỉ lễ đều như một trận chiến.</p><p>8. Gặp chuyện không vui, bị người bắt nạt... gọi điện về cho bố mẹ, rõ ràng rất muốn khóc nhưng mở miệng ra vẫn luôn là câu: "Con ổn mà!".</p><p>9. Xa quê rồi mới biết quê mình đẹp đến nhường nào.</p><p>10. Thành phố này rất náo nhiệt nhưng mình vẫn thích ở nhà mình hơn.</p><p>11. Có đôi khi đang ngồi giữa bạn bè cũng cảm thấy thật xa lạ và cô đơn.</p><p>12. Thành phố này có biết bao ngọn đèn được thắp lên mỗi tối nhưng chẳng có ngọn đèn nào trong đó bật sáng vì bạn cả.</p><p>13. Những lúc nhớ bố mẹ, nhớ bạn bè cũng chỉ có thể nhớ mà thôi.</p><p>14. Mới học ở thành phố khác đã thế này thì không biết những bạn du học ở đất nước khác sẽ như thế nào đây…</p><p>15. Ngày ấy chỉ muốn học xa nhà để có thể thoát khỏi sự quản lý, trói buộc từ bố mẹ,&nbsp;</p><p>mà không ngờ thứ mình gắng hết sức để trốn khỏi lại là ấm áp và sự an toàn.</p>', N'https://gaixinhbikini.com/wp-content/uploads/2022/08/hinh-anh-gai-xinh-29.jpg', 1)
INSERT [dbo].[Course] ([Id], [Title], [DateCreated], [Summary], [CourseCategoryId], [UserCreated], [Info], [image], [isActivate]) VALUES (11, N'THI CU VAT VA', CAST(N'2022-10-26T20:29:34.737' AS DateTime), N'"Nếu bạn thật sự quan trọng với một người thì người đó sẽ luôn tìm cách để có thời gian dành cho bạn.
Không lý do. Không dối trá. Và không thất hứa."', 2, N'hieu', N'<p>Rất lâu rồi, không thích một ai,</p><p>Rất lâu về sau chúng ta không hề thích ai, rất lâu không hề yêu ai, dần dần quen với cuộc sống chỉ có một mình.</p><p>Sau những vấp ngã, dần dần càng ngày càng hình thành bản năng từ chối cuộc sống của hai người.</p><p>Vốn dĩ không phải chúng ta không gặp được người phù hợp, mà là có gặp đó, nhưng bởi đơn độc quá lâu,&nbsp;</p><p>ngay cả dũng khí đi thích một người cũng không có, thì để yêu một người lại càng khó khăn biết bao nhiêu.</p><p>Người như vậy, không phải đối với tình yêu không tin tưởng, mà là rất sợ bị tổn thương.</p>', N'https://image-us.24h.com.vn/upload/3-2022/images/2022-07-11/21-1657535366-24-width650height650.jpg', 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCategory] ON 

INSERT [dbo].[CourseCategory] ([Id], [Name]) VALUES (1, N'JAVA')
INSERT [dbo].[CourseCategory] ([Id], [Name]) VALUES (2, N'C#')
INSERT [dbo].[CourseCategory] ([Id], [Name]) VALUES (11, N'C++')
SET IDENTITY_INSERT [dbo].[CourseCategory] OFF
GO
INSERT [dbo].[User] ([username], [password], [isActivate], [isAdmin], [isAuthor]) VALUES (N'admin', N'111', 1, 1, NULL)
INSERT [dbo].[User] ([username], [password], [isActivate], [isAdmin], [isAuthor]) VALUES (N'haha', N'111', 0, 0, 0)
INSERT [dbo].[User] ([username], [password], [isActivate], [isAdmin], [isAuthor]) VALUES (N'hieu', N'123', 1, 0, 1)
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CourseCategory] FOREIGN KEY([CourseCategoryId])
REFERENCES [dbo].[CourseCategory] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CourseCategory]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_User] FOREIGN KEY([UserCreated])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_User]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_Course] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_Course]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_User]
GO
