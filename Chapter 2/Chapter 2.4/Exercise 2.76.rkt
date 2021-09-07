#lang racket

;generic operations(each operation checks type and explicitly dispatches it)
;adding new type means changing all operation definitions
;adding new operation means defining operation for all types (additive)

;message passing
;adding new type means adding new constructor for that type (additive)
;adding new operation means changing all constructors to support that type

;data directed style
;adding new type means new column (additive)
;adding new operation means new row (additive)
;code is less spread out, but changing code is hard
;since the definition of a type/operation might be located in multiple packages



;message passing is good for adding new types
;generic operations is good for adding operations
