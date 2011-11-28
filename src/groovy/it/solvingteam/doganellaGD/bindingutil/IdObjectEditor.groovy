package it.solvingteam.doganellaGD.bindingutil


import java.beans.PropertyEditorSupport

class IdObjectEditor extends PropertyEditorSupport {

    Class domainClass

    void setAsText(String text) {
        if (text) {
           def id = Long.parseLong(text.trim())
           value =   domainClass.get(id)
            
        }
    }

    String getAsText() {
        value
    }
}
