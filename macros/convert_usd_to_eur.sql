{% macro convert_usd_to_eur(usd_column, exchange_rate=0.92) %}
    /* Generic macro to convert USD amounts to EUR.
       Default rate is 0.92, but can be overridden during the call.
    */
    round({{ usd_column }} * {{ exchange_rate }}, 2)
{% endmacro %}