package org.datacite.mds.web.ui.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.datacite.mds.util.SecurityUtils;
import org.datacite.mds.web.ui.UiController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.switchuser.SwitchUserGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutOrExitController implements UiController {
    Logger log = Logger.getLogger(LogoutOrExitController.class);
    /**
     * If the current user is logged in by "switch user", return to the original
     * user. Otherwise do a normal logout.
     */
    @RequestMapping(value = "/resources/logout_or_return", method = RequestMethod.GET)
    public String logoutOrReturn(HttpServletRequest request) {
        if (! SecurityUtils.isLoggedIn() || request.getSession().isNew())
            return "redirect:/";
        
        Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
        for (GrantedAuthority auth : currentAuth.getAuthorities()) {
            if (auth instanceof SwitchUserGrantedAuthority) {
                SwitchUserGrantedAuthority su = (SwitchUserGrantedAuthority) auth;
                log.debug("switch back to user " + su.getSource().getName());
                return "redirect:/resources/j_spring_security_exit_user";
            }
        }
        log.debug("normal logout");
        return "redirect:/resources/j_spring_security_logout";
    }
}
