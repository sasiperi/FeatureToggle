package com.ffweb.thymeleaf;

import org.ff4j.FF4j;
import org.thymeleaf.Arguments;
import org.thymeleaf.dom.Element;
import org.thymeleaf.processor.attr.AbstractConditionalVisibilityAttrProcessor;


public class MyFF4jDisableAttrProcessor extends AbstractConditionalVisibilityAttrProcessor
{

    private FF4j ff4j;

    protected MyFF4jDisableAttrProcessor(final String attributeName)
    {
        super(attributeName);
    }

    protected MyFF4jDisableAttrProcessor(FF4j ff4j)
    {
        super("disable");
        this.ff4j = ff4j;
    }

    @Override
    public int getPrecedence()
    {
        // => si feature enable, c'est ultra prioritaire mais moins que si elle
        // est activée:-)
        return 10;
    }

    @Override
    protected boolean isVisible(Arguments arguments, Element element, String attributeName)
    {
        final String feature = element.getAttributeValue(attributeName);
        if (feature == null || feature.trim().equals(""))
        {
            return false;
        }

        return ff4j.check(feature);
    }

}
