#set page(height: auto)
#set text(font: ("Times New Roman"), size: 12pt)
#table(
  columns: (auto, auto, auto, auto),
  inset: 5pt,
  align: left + horizon,
  // Header row
  [*Table Name*], [*Column Name*], [*Data Type*], [*Constraints/Notes*],
  
  // user_actions table
  table.cell(rowspan: 5)[#text(weight: "bold")[user_actions]], 
  [action_id],       [varchar(100)], [PK],
  [user_id],         [varchar(255)], [FK (-> n_user)],
  [article_id],      [varchar(100)], [FK (-> articles)],
  [action_type],     [tinyint],      [],
  [action_time],     [datetime],     [],
  
  // n_user table
  table.cell(rowspan: 10)[#text(weight: "bold")[n_user]],
  [user_id],         [varchar(255)], [PK],
  [nickname],        [varchar(255)], [],
  [avatar_url],      [varchar(255)], [],
  [gender],          [int],          [],
  [address],         [varchar(255)], [],
  [create_time],     [datetime],     [],
  [update_time],     [datetime],     [],
  [honor],           [int],          [],
  [points],          [int],          [],
  [status],          [int],          [],
  
  // search_records table
  table.cell(rowspan: 9)[#text(weight: "bold")[search_records]],
  [search_id],      [bigint],       [PK],
  [user_id],        [varchar(100)], [FK (-> n_user)],
  [content_type],   [varchar(20)],  [],
  [type],           [tinyint],      [],
  [pic],            [varchar(255)], [],
  [content],        [text],         [],
  [time],           [datetime],     [],
  [display],        [tinyint(1)],   [Default: 1],
  [operate],        [tinyint],      [],
  
  // articles table
  table.cell(rowspan: 12)[#text(weight: "bold")[articles]],
  [article_id],     [varchar(100)], [PK],
  [user_id],        [varchar(255)], [FK (-> n_user)],
  [title],          [varchar(100)], [],
  [content],        [text],         [],
  [images],         [json],         [],
  [view_count],     [int],          [Default: 0],
  [like_count],     [int],          [Default: 0],
  [collect_count],  [int],          [Default: 0],
  [comment_count],  [int],          [Default: 0],
  [status],         [tinyint],      [Default: 1],
  [create_time],    [datetime],     [],
  [update_time],    [datetime],     [],
  
  // article_comments table
  table.cell(rowspan: 5)[#text(weight: "bold")[article_comments]],
  [articlecomment_id], [varchar(255)], [PK],
  [article_id],        [varchar(255)], [FK (-> articles)],
  [user_id],           [varchar(255)], [FK (-> n_user)],
  [comment],           [text],         [],
  [comment_time],      [datetime],     [],
)
