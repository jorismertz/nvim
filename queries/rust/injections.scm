; extends

; Injects SQL highlighting into `sqlx::query!` macro invocations
(macro_invocation
  (scoped_identifier
    path: (identifier) @path (#eq? @path "sqlx")
    name: (identifier) @name (#eq? @name "query"))

  (token_tree
    (raw_string_literal
      (string_content) @injection.content
      (#set! injection.language "sql"))
    )
  )


; Injects SQL highlighting into `sqlx::query` invocations
(field_expression
  (call_expression
    (scoped_identifier
      path: (identifier) @path (#eq? @path "sqlx")
      name: (identifier) @name (#eq? @name "query")) 
    (arguments
      (raw_string_literal
        (string_content) @injection.content
        (#set! injection.language "sql")
      )
    )
  ) 
) 

