// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.datacite.mds.domain;

import java.lang.Boolean;
import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import java.util.Set;
import org.datacite.mds.domain.Prefix;

privileged aspect Allocator_Roo_JavaBean {
    
    public String Allocator.getSymbol() {
        return this.symbol;
    }
    
    public void Allocator.setSymbol(String symbol) {
        this.symbol = symbol;
    }
    
    public String Allocator.getPassword() {
        return this.password;
    }
    
    public void Allocator.setPassword(String password) {
        this.password = password;
    }
    
    public String Allocator.getName() {
        return this.name;
    }
    
    public void Allocator.setName(String name) {
        this.name = name;
    }
    
    public String Allocator.getContactName() {
        return this.contactName;
    }
    
    public void Allocator.setContactName(String contactName) {
        this.contactName = contactName;
    }
    
    public String Allocator.getContactEmail() {
        return this.contactEmail;
    }
    
    public Integer Allocator.getDoiQuotaAllowed() {
        return this.doiQuotaAllowed;
    }
    
    public void Allocator.setDoiQuotaAllowed(Integer doiQuotaAllowed) {
        this.doiQuotaAllowed = doiQuotaAllowed;
    }
    
    public Integer Allocator.getDoiQuotaUsed() {
        return this.doiQuotaUsed;
    }
    
    public void Allocator.setDoiQuotaUsed(Integer doiQuotaUsed) {
        this.doiQuotaUsed = doiQuotaUsed;
    }
    
    public Set<Prefix> Allocator.getPrefixes() {
        return this.prefixes;
    }
    
    public void Allocator.setPrefixes(Set<Prefix> prefixes) {
        this.prefixes = prefixes;
    }
    
    public Boolean Allocator.getIsActive() {
        return this.isActive;
    }
    
    public void Allocator.setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    
    public String Allocator.getRoleName() {
        return this.roleName;
    }
    
    public void Allocator.setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    public String Allocator.getComments() {
        return this.comments;
    }
    
    public void Allocator.setComments(String comments) {
        this.comments = comments;
    }
    
    public Date Allocator.getCreated() {
        return this.created;
    }
    
    public void Allocator.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Allocator.getUpdated() {
        return this.updated;
    }
    
    public void Allocator.setUpdated(Date updated) {
        this.updated = updated;
    }
    
    public void Allocator.setExperiments(String experiments) {
        this.experiments = experiments;
    }
    
}
