(asdf:defsystem :bodge-math
  :description "Math routines"
  :version "1.0.0"
  :license "MIT"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :depends-on (bodge-utilities rtg-math)
  :pathname "src/"
  :serial t
  :components ((:file "packages")
               (:file "types")
               (:file "scalar")
               (:module vec
                :serial t
                :components ((:file "vector")
                             (:file "vec2")
                             (:file "vec3")
                             (:file "vec4")))
               (:module mat
                :serial t
                :components ((:file "matrix")
                             (:file "mat2")
                             (:file "mat3")
                             (:file "mat4")))
               (:file "quaternion")))
