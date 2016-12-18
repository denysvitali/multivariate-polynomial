(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(quicklisp:quickload "clunit")

(clunit:defsuite mvpoli ())

"Tests for is-varpower"
(clunit:defsuite is-varpower (mvpoli))

(clunit:deftest test-is-varpower-1 (is-varpower)
  (clunit:assert-true (is-varpower '(v 1 x))))

(clunit:deftest test-is-varpower-2 (is-varpower)
  (clunit:assert-false (is-varpower '(v 1 x e))))

(clunit:deftest test-is-varpower-3 (is-varpower)
  (clunit:assert-false (is-varpower '(v e x))))

(clunit:deftest test-is-varpower-4 (is-varpower)
  (clunit:assert-false (is-varpower '(v 1 1))))

"Tests for eval-as-number"
(clunit:defsuite eval-as-number (mvpoli))

(clunit:deftest test-eval-as-number-1 (eval-as-number)
  (clunit:assert-true  (= 12 (eval-as-number '(* 3 4)))))

(clunit:deftest test-eval-as-number-2 (eval-as-number)
  (clunit:assert-true  (= 48 (eval-as-number '(* (* 3 4) (+ 2 2))))))

"Tests for exptp"
(clunit:defsuite exptp (mvpoli))

(clunit:deftest test-exptp-1 (exptp)
  (clunit:assert-true  (exptp '(expt x 4))))

(clunit:deftest test-exptp-2 (exptp)
  (clunit:assert-true  (exptp '(expt y 1))))

"Tests for expression-variable-p"
(clunit:defsuite expression-variable-p (mvpoli))

(clunit:deftest test-expression-variable-p-1 (expression-variable-p)
  (clunit:assert-true  (expression-variable-p '(expt x 4))))

(clunit:deftest test-expression-variable-p-2 (expression-variable-p)
  (clunit:assert-true  (expression-variable-p 't)))

"Tests for monomial-expression-component-p"
(clunit:defsuite monomial-expression-component-p (mvpoli))

(clunit:deftest test-monomial-expression-component-p-1 (monomial-expression-component-p)
  (clunit:assert-true  (monomial-expression-component-p '(expt x 4))))

(clunit:deftest test-monomial-expression-component-p-2 (monomial-expression-component-p)
  (clunit:assert-true  (monomial-expression-component-p 't)))

(clunit:deftest test-monomial-expression-component-p-3 (monomial-expression-component-p)
  (clunit:assert-true  (monomial-expression-component-p 4)))

(clunit:deftest test-monomial-expression-component-p-4 (monomial-expression-component-p)
  (clunit:assert-true  (monomial-expression-component-p '4)))

"Tests for varpower-power"
(clunit:defsuite varpower-power (mvpoli))

(clunit:deftest test-varpower-power-1 (varpower-power)
  (clunit:assert-true (equal (varpower-power '(V 1 x)) 1)))

"Tests for varpower-symbol"
(clunit:defsuite varpower-symbol (mvpoli))

(clunit:deftest test-varpower-symbol-1 (varpower-symbol)
  (clunit:assert-true (equal (varpower-symbol '(V 1 x)) 'x)))

"Tests for is-monomial"
(clunit:defsuite is-monomial (mvpoli))

(clunit:deftest test-is-monomial-1 (is-monomial)
  (clunit:assert-true T))

"Tests for monomial-varpowers"
(clunit:defsuite monomial-varpowers (mvpoli))

(clunit:deftest test-monomial-varpowers-1 (monomial-varpowers)
  (clunit:assert-true (equal (monomial-varpowers (as-monomial
  '(* q w 1 2 3 x y z (expt x 3)))) '((V 1 Q) (V 1 W) (V 4 X) (V 1 Y) (V 1 Z)))))

"Tests for monomial-degree"
(clunit:defsuite monomial-degree (mvpoli))

(clunit:deftest test-monomial-degree-1 (monomial-degree)
  (clunit:assert-true (equal (monomial-degree (as-monomial
  '(* q w 1 2 3 x y z (expt x 3)))) 8)))

"Tests for monomial-coefficient"
(clunit:defsuite monomial-coefficient (mvpoli))

(clunit:deftest test-monomial-coefficient-1 (monomial-coefficient)
  (clunit:assert-true (equal (monomial-coefficient (as-monomial
  '(* q w 1 2 3 x y z (expt x 3)))) 6)))

"Tests for compare-varpowers"
(clunit:defsuite compare-varpowers (mvpoli))

(clunit:deftest test-compare-varpowers-1 (compare-varpowers)
  (clunit:assert-true T))

"Tests for lesser-varpower"
(clunit:defsuite lesser-varpower (mvpoli))

(clunit:deftest test-lesser-varpower-1 (lesser-varpower)
  (clunit:assert-true T))

"Tests for compare-monomials"
(clunit:defsuite compare-monomials (mvpoli))

(clunit:deftest test-compare-monomials-1 (compare-monomials)
  (clunit:assert-true T))

"Tests for monomial-expression-p"
(clunit:defsuite monomial-expression-p (mvpoli))

(clunit:deftest test-monomial-expression-p-1 (monomial-expression-p)
  (clunit:assert-true T))

"Tests for coefficients"
(clunit:defsuite coefficients (mvpoli))

(clunit:deftest test-coefficients-1 (coefficients)
  (clunit:assert-true T))

"Tests for total-coefficient"
(clunit:defsuite total-coefficient (mvpoli))

(clunit:deftest test-total-coefficient-1 (total-coefficient)
  (clunit:assert-true T))

"Tests for expression-variables"
(clunit:defsuite expression-variables (mvpoli))

(clunit:deftest test-expression-variables-1 (expression-variables)
  (clunit:assert-true T))

"Tests for expression-variable-to-varpower"
(clunit:defsuite expression-variable-to-varpower (mvpoli))

(clunit:deftest test-expression-variable-to-varpower-1 (expression-variable-to-varpower)
  (clunit:assert-true T))

"Tests for varpowers-from-expression"
(clunit:defsuite varpowers-from-expression (mvpoli))

(clunit:deftest test-varpowers-from-expression-1 (varpowers-from-expression)
  (clunit:assert-true T))

"Tests for sort-varpowers"
(clunit:defsuite sort-varpowers (mvpoli))

(clunit:deftest test-sort-varpowers-1 (sort-varpowers)
  (clunit:assert-true T))

"Tests for total-degree-varpowers"
(clunit:defsuite total-degree-varpowers (mvpoli))

(clunit:deftest test-total-degree-varpowers-1 (total-degree-varpowers)
  (clunit:assert-true T))

"Tests for build-monomial-object"
(clunit:defsuite build-monomial-object (mvpoli))

(clunit:deftest test-build-monomial-object-1 (build-monomial-object)
  (clunit:assert-true T))

"Tests for compress-varpowers-reducer"
(clunit:defsuite compress-varpowers-reducer (mvpoli))

(clunit:deftest test-compress-varpowers-reducer-1 (compress-varpowers-reducer)
  (clunit:assert-true T))

"Tests for compress-varpowers"
(clunit:defsuite compress-varpowers (mvpoli))

(clunit:deftest test-compress-varpowers-1 (compress-varpowers)
  (clunit:assert-true T))

"Tests for parse-monomial-expression"
(clunit:defsuite parse-monomial-expression (mvpoli))

(clunit:deftest test-parse-monomial-expression-1 (parse-monomial-expression)
  (clunit:assert-true T))

"Tests for as-monomial"
(clunit:defsuite as-monomial (mvpoli))

(clunit:deftest test-as-monomial-1 (as-monomial)
  (clunit:assert-true T))

"Tests for polynomial-expression-p"
(clunit:defsuite polynomial-expression-p (mvpoli))

(clunit:deftest test-polynomial-expression-p-1 (polynomial-expression-p)
  (clunit:assert-true T))

"Tests for sort-monomials"
(clunit:defsuite sort-monomials (mvpoli))

(clunit:deftest test-sort-monomials-1 (sort-monomials)
  (clunit:assert-true T))

"Tests for compress-monomials-reducer"
(clunit:defsuite compress-monomials-reducer (mvpoli))

(clunit:deftest test-compress-monomials-reducer-1 (compress-monomials-reducer)
  (clunit:assert-true T))

"Tests for compress-monomials"
(clunit:defsuite compress-monomials (mvpoli))

(clunit:deftest test-compress-monomials-1 (compress-monomials)
  (clunit:assert-true T))

"Tests for parse-polynomial-expression"
(clunit:defsuite parse-polynomial-expression (mvpoli))

(clunit:deftest test-parse-polynomial-expression-1 (parse-polynomial-expression)
  (clunit:assert-true T))

"Tests for as-polynomial"
(clunit:defsuite as-polynomial (mvpoli))

(clunit:deftest test-as-polynomial-1 (as-polynomial)
  (clunit:assert-true T))



(defun run-tests()
	(clunit:run-suite 'mvpoli :report-progress T))

(run-tests)
