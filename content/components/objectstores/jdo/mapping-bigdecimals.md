Title: Mapping BigDecimals

Working with `java.math.BigDecimal` properties takes a little care due to scale/precision issues.  This is certainly the case for HSQL, and (may be the case ) for all other RDBMS' too.

For example, suppose we have:

        private BigDecimal impact;

        public BigDecimal getImpact() {
            return impact;
        }
        public void setImpact(final BigDecimal impact) {
            this.impact = impact;
        }

JDO/DataNucleus creates, at least with HSQL, the table with the field type as NUMERIC(19).  No decimal digits are admitted.  (Further details [here](http://hsqldb.org/doc/2.0/guide/sqlgeneral-chapt.html#sgc_numeric_types)).

What this implies is that, when a record is inserted, a log entry similar to this one appears:

    INSERT INTO ENTITY(..., IMPACT, ....) VALUES (...., 0.5, ....)

But when that same record is retrieved, the log will show that a value of "0" is returned, instead of 0.5.

The solution is to explicitly add the scale to the field like this:

    @javax.jdo.annotations.Column(scale=2)
    private BigDecimal impact;

    public BigDecimal getImpact() {
        return impact;
    }
    public void setImpact(final BigDecimal impact) {
        this.impact = impact;
    }


In addition, you should also set the scale of the `BigDecimal`, using `setScale(scale, roundingMode)`.  More information can be found [here](http://www.opentaps.org/docs/index.php/How_to_Use_Java_BigDecimal:_A_Tutorial) and [here](http://www.tutorialspoint.com/java/math/bigdecimal_setscale_rm_roundingmode.htm).



