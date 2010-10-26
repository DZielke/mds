// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.datacite.mds.web;

import java.io.UnsupportedEncodingException;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.datacite.mds.domain.Allocator;
import org.datacite.mds.domain.Datacentre;
import org.datacite.mds.domain.Prefix;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DatacentreController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DatacentreController.create(@Valid Datacentre datacentre, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("datacentre", datacentre);
            return "datacentres/create";
        }
        datacentre.persist();
        return "redirect:/datacentres/" + encodeUrlPathSegment(datacentre.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DatacentreController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("datacentre", Datacentre.findDatacentre(id));
        model.addAttribute("itemId", id);
        return "datacentres/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DatacentreController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("datacentres", Datacentre.findDatacentreEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Datacentre.countDatacentres() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("datacentres", Datacentre.findAllDatacentres());
        }
        return "datacentres/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DatacentreController.update(@Valid Datacentre datacentre, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("datacentre", datacentre);
            return "datacentres/update";
        }
        datacentre.merge();
        return "redirect:/datacentres/" + encodeUrlPathSegment(datacentre.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DatacentreController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("datacentre", Datacentre.findDatacentre(id));
        return "datacentres/update";
    }
    
    @RequestMapping(params = { "find=BySymbolEquals", "form" }, method = RequestMethod.GET)
    public String DatacentreController.findDatacentresBySymbolEqualsForm(Model model) {
        return "datacentres/findDatacentresBySymbolEquals";
    }
    
    @RequestMapping(params = "find=BySymbolEquals", method = RequestMethod.GET)
    public String DatacentreController.findDatacentresBySymbolEquals(@RequestParam("symbol") String symbol, Model model) {
        model.addAttribute("datacentres", Datacentre.findDatacentresBySymbolEquals(symbol).getResultList());
        return "datacentres/list";
    }
    
    @RequestMapping(params = { "find=ByNameLike", "form" }, method = RequestMethod.GET)
    public String DatacentreController.findDatacentresByNameLikeForm(Model model) {
        return "datacentres/findDatacentresByNameLike";
    }
    
    @RequestMapping(params = "find=ByNameLike", method = RequestMethod.GET)
    public String DatacentreController.findDatacentresByNameLike(@RequestParam("name") String name, Model model) {
        model.addAttribute("datacentres", Datacentre.findDatacentresByNameLike(name).getResultList());
        return "datacentres/list";
    }
    
    @ModelAttribute("allocators")
    public Collection<Allocator> DatacentreController.populateAllocators() {
        return Allocator.findAllAllocators();
    }
    
    private String DatacentreController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
