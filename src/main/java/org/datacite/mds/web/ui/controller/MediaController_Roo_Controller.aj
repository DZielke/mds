// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.datacite.mds.web.ui.controller;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.datacite.mds.domain.Dataset;
import org.datacite.mds.domain.Media;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MediaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String MediaController.create(@Valid Media media, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("media", media);
            return "medias/create";
        }
        uiModel.asMap().clear();
        media.persist();
        return "redirect:/medias/" + encodeUrlPathSegment(media.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String MediaController.createForm(Model uiModel) {
        uiModel.addAttribute("media", new Media());
        return "medias/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String MediaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("media", Media.findMedia(id));
        uiModel.addAttribute("itemId", id);
        return "medias/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String MediaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("medias", Media.findMediaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Media.countMedias() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("medias", Media.findAllMedias());
        }
        return "medias/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String MediaController.update(@Valid Media media, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("media", media);
            return "medias/update";
        }
        uiModel.asMap().clear();
        media.merge();
        return "redirect:/medias/" + encodeUrlPathSegment(media.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String MediaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("media", Media.findMedia(id));
        return "medias/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String MediaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Media.findMedia(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/medias";
    }
    
    @ModelAttribute("datasets")
    public Collection<Dataset> MediaController.populateDatasets() {
        return Dataset.findAllDatasets();
    }
    
    @ModelAttribute("medias")
    public Collection<Media> MediaController.populateMedias() {
        return Media.findAllMedias();
    }
    
    String MediaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
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
