package com.ffweb.thymeleaf;

import java.util.HashSet;
import java.util.Set;

import org.ff4j.FF4j;
import org.thymeleaf.dialect.AbstractDialect;
import org.thymeleaf.processor.IProcessor;

/**
 * Created by benoitmeriaux on 08/01/15.
 */
public class MyFF4JDialect extends AbstractDialect
{

    private FF4j ff4j;

    public MyFF4JDialect()
    {
        super();
    }

    //
    // All of this dialect's attributes and/or tags
    // will start with 'ff4j:'
    //
    public String getPrefix()
    {
        return "ff4j";
    }

    public void setFF4J(FF4j ff4j)
    {
        this.ff4j = ff4j;
    }

    //
    // The processors.
    //
    @Override
    public Set<IProcessor> getProcessors()
    {
        final Set<IProcessor> processors = new HashSet<IProcessor>();
        processors.add(new MyFF4jEnableAttrProcessor(ff4j));
        processors.add(new MyFF4jDisableAttrProcessor(ff4j));
        return processors;
    }
}
