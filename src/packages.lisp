(bodge-util:define-package :bodge-math
  (:use :cl :bodge-util)
  (:export +double-infinity+
           +single-infinity+
           ;; OPERATIONS
           lerp
           nlerp
           mult
           add
           div
           subt
           cross
           dot
           normalize
           inverse
           transpose
           ;; VECTORS
           vec
           vref
           x
           y
           z
           w
           vector-length
           vec->array
           vec2
           vec3
           vec4
           sequence->vec2
           sequence->vec3
           sequence->vec4
           value->vec2
           value->vec3
           value->vec4
           ;; MATRICES
           mat
           square-mat
           mat2
           mat3
           mat4
           mref
           mat->array
           square-matrix-size
           copy-mat2
           copy-mat3
           copy-mat4
           value->mat2
           value->mat3
           value->mat4
           identity-mat2
           identity-mat3
           identity-mat4
           sequence->mat2
           sequence->mat3
           sequence->mat4
           euler-angle->mat2
           euler-angle->mat3-homo
           euler-angles->mat3
           euler-angles->mat4-homo
           euler-axis->mat3
           euler-axis->mat4-homo
           rotation-translation->mat3-homo
           rotation-translation->mat4-homo
           translation-mat3
           translation-mat3-homo
           translation-mat4-homo
           vec->translation-mat3-homo
           vec->translation-mat4-homo
           scaling-mat3
           scaling-mat3-homo
           scaling-mat4-homo
           vec->scaling-mat3
           vec->scaling-mat3-homo
           vec->scaling-mat4-homo
           basis->mat2
           basis->mat3
           basis->mat3-homo
           basis->mat4
           basis->mat4-homo
           perspective-projection-mat
           orthographic-projection-mat
           ;; QUATERNIONS
           quat
           identity-quat
           sequence->quat
           euler-axis->quat
           euler-angles->quat
           quat->rotation-mat3
           quat->rotation-mat4-homo
           rotate-vec3-with-quat))