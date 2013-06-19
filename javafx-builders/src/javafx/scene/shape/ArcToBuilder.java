/* 
 * Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

package javafx.scene.shape;

/**
Builder class for javafx.scene.shape.ArcTo
@see javafx.scene.shape.ArcTo
@deprecated This class is deprecated and will be removed in the next version
* @since JavaFX 2.0
*/
@javax.annotation.Generated("Generated by javafx.builder.processor.BuilderProcessor")
@Deprecated
public class ArcToBuilder<B extends javafx.scene.shape.ArcToBuilder<B>> extends javafx.scene.shape.PathElementBuilder<B> implements javafx.util.Builder<javafx.scene.shape.ArcTo> {
    protected ArcToBuilder() {
    }
    
    /** Creates a new instance of ArcToBuilder. */
    @SuppressWarnings({"deprecation", "rawtypes", "unchecked"})
    public static javafx.scene.shape.ArcToBuilder<?> create() {
        return new javafx.scene.shape.ArcToBuilder();
    }
    
    private int __set;
    public void applyTo(javafx.scene.shape.ArcTo x) {
        super.applyTo(x);
        int set = __set;
        if ((set & (1 << 0)) != 0) x.setLargeArcFlag(this.largeArcFlag);
        if ((set & (1 << 1)) != 0) x.setRadiusX(this.radiusX);
        if ((set & (1 << 2)) != 0) x.setRadiusY(this.radiusY);
        if ((set & (1 << 3)) != 0) x.setSweepFlag(this.sweepFlag);
        if ((set & (1 << 4)) != 0) x.setX(this.x);
        if ((set & (1 << 5)) != 0) x.setXAxisRotation(this.XAxisRotation);
        if ((set & (1 << 6)) != 0) x.setY(this.y);
    }
    
    private boolean largeArcFlag;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#isLargeArcFlag() largeArcFlag} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B largeArcFlag(boolean x) {
        this.largeArcFlag = x;
        __set |= 1 << 0;
        return (B) this;
    }
    
    private double radiusX;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#getRadiusX() radiusX} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B radiusX(double x) {
        this.radiusX = x;
        __set |= 1 << 1;
        return (B) this;
    }
    
    private double radiusY;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#getRadiusY() radiusY} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B radiusY(double x) {
        this.radiusY = x;
        __set |= 1 << 2;
        return (B) this;
    }
    
    private boolean sweepFlag;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#isSweepFlag() sweepFlag} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B sweepFlag(boolean x) {
        this.sweepFlag = x;
        __set |= 1 << 3;
        return (B) this;
    }
    
    private double x;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#getX() x} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B x(double x) {
        this.x = x;
        __set |= 1 << 4;
        return (B) this;
    }
    
    private double XAxisRotation;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#getXAxisRotation() XAxisRotation} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B XAxisRotation(double x) {
        this.XAxisRotation = x;
        __set |= 1 << 5;
        return (B) this;
    }
    
    private double y;
    /**
    Set the value of the {@link javafx.scene.shape.ArcTo#getY() y} property for the instance constructed by this builder.
    */
    @SuppressWarnings("unchecked")
    public B y(double x) {
        this.y = x;
        __set |= 1 << 6;
        return (B) this;
    }
    
    /**
    Make an instance of {@link javafx.scene.shape.ArcTo} based on the properties set on this builder.
    */
    public javafx.scene.shape.ArcTo build() {
        javafx.scene.shape.ArcTo x = new javafx.scene.shape.ArcTo();
        applyTo(x);
        return x;
    }
}
