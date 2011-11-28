package it.solvingteam.doganellaGD.bindingutil




import it.solvingteam.doganellaGD.core.Fruitore;

import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry


public class MyPropertyEditorRegistrar implements PropertyEditorRegistrar {
    public void registerCustomEditors(PropertyEditorRegistry propertyEditorRegistry) {

        propertyEditorRegistry.registerCustomEditor(Fruitore, 'fruitore', new IdObjectEditor(domainClass: Fruitore))
       
                    
    }
}
