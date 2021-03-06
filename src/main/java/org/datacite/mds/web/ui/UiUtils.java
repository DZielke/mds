package org.datacite.mds.web.ui;

import java.util.Collection;
import java.util.LinkedList;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.datacite.mds.domain.AllocatorOrDatacentre;
import org.datacite.mds.util.SecurityUtils;
import org.datacite.mds.util.Utils;
import org.springframework.security.core.Authentication;

public class UiUtils {
    
    public static void refreshSymbolsForSwitchUser(HttpSession session) {
        Collection<? extends AllocatorOrDatacentre> users = SecurityUtils.getDirectInferiorsOfCurrentAllocator();
        Collection<String> symbols = new TreeSet<String>();
        symbols.addAll(Utils.toSymbols(users));

        if (!symbols.isEmpty())
            symbols.add(""); // add empty string to disable symbol default selection

        session.setAttribute("symbols", symbols);
    }
    
    public static void setLoginPathwaySessionAttribute(HttpSession session) {
        LinkedList<String> pathway = new LinkedList<String>();

        Authentication auth = SecurityUtils.getCurrentAuthentication();
        while(auth != null) {
            pathway.addFirst(auth.getName());
            auth = SecurityUtils.getOriginalUser(auth);
        }

        session.setAttribute("login_pathway", pathway);
    }


}
