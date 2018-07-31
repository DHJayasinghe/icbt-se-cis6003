package com.educan.oass.models;

/**
 *
 * @author "Dhanuka Jayasinghe"
 */
public class Field {
    private int fieldId;
    private String fieldName;
    private String description;

    public int getFieldId() {
        return fieldId;
    }

    public void setFieldId(int fieldId) {
        this.fieldId = fieldId;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
