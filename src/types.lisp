(cl:in-package :bodge-math)

(defgeneric lerp (this that f))
(defgeneric normalize (this))
(defgeneric inverse (this))
(defgeneric transpose (this))


(defgeneric multiply (this that))
(defgeneric addere (this that))
(defgeneric divide (this that))
(defgeneric subtract (this that))


(defgeneric dot-product (this that))
(defgeneric cross-product (this that))


(macrolet ((defreduced (name generic)
             `(definline ,name (arg0 &rest args)
                (reduce (lambda (this that) (,generic this that))
                        args :initial-value arg0))))

  (defreduced mult multiply)
  (defreduced add addere)
  (defreduced div divide)
  (defreduced subt subtract)
  (defreduced dot dot-product)
  (defreduced cross cross-product))


(definline nlerp (this that f)
  (normalize (lerp this that f)))

;;;
;;; Vectors
;;;
(defclass vec () ())

(defgeneric value-of (vec))

(defmethod print-object ((object vec) stream)
  (print-unreadable-object (object stream
                            :type (class-name-of object))
    (format stream "~{~A~^ ~}"
            (map 'list #'identity (value-of object)))))


(defclass vec2 (vec)
  ((value :initarg :value :initform (v2:make 0.0 0.0) :type rtg-math.types:vec2
          :reader value-of)))


(defclass vec3 (vec)
  ((value :initarg :value :initform (v3:make 0.0 0.0 0.0) :type rtg-math.types:vec3
          :reader value-of)))


(defclass vec4 (vec)
  ((value :initarg :value :initform (v4:make 0.0 0.0 0.0 0.0) :type rtg-math.types:vec4
          :reader value-of)))

;;;
;;; Matricies
;;;
(defclass mat () ())


(defclass square-mat (mat) ())


(declaim (ftype (function (square-mat) (integer 2 4)) square-matrix-size))
(definline square-matrix-size (square-mat)
  (etypecase square-mat
    (mat2 2)
    (mat3 3)
    (mat4 4)))


(defun print-mat (object accessor stream)
  (declare (ignore accessor))
  (print-unreadable-object (object stream
                            :type (class-name-of object))
    (format stream "~{~A~^ ~}" (map 'list #'identity (value-of object)))))


(defclass mat2 (square-mat)
  ((value :initarg :value :initform (m2:0!) :type rtg-math.types:mat2 :reader value-of)))


(defmethod print-object ((object mat2) stream)
  (print-mat object #'m2:melm stream))


(defclass mat3 (square-mat)
  ((value :initarg :value :initform (m3:0!) :type rtg-math.types:mat3 :reader value-of)))


(defmethod print-object ((object mat3) stream)
  (print-mat object #'m3:melm stream))


(defclass mat4 (square-mat)
  ((value :initarg :value :initform (m4:0!) :type rtg-math.types:mat4 :reader value-of)))


(defmethod print-object ((object mat4) stream)
  (print-mat object #'m4:melm stream))



;;;
;;; Quaternions
;;;
(defclass quat ()
  ((value :initarg :value :initform (q:0!) :type rtg-math.types:quaternion :reader value-of)))


(definline make-wrapped (type val)
  (make-instance type :value val))
