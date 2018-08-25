/**
 * 
 */
package com.ffweb.service;

import org.springframework.stereotype.Component;

/**
 * @author venkatasuryasasikala
 *
 */
@Component("caluculationServiceDecimal")
public class CaluculationServiceDecimalImpl implements CalculationsService
{

    /* (non-Javadoc)
     * @see com.ffweb.service.CalculationsService#addNumbers(int, int)
     */
    @Override
    public String addNumbers(int numOne, int numTwo)
    {
        return Integer.toString(numOne+numTwo);
    }

}
