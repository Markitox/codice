
<%@ page import="com.synergyj.codice.news.NewsItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit NewsItem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">NewsItem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New NewsItem</g:link></span>
        </div>
        <div class="body">
            <h1>Edit NewsItem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${newsItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${newsItemInstance?.id}" />
                <input type="hidden" name="version" value="${newsItemInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'title','errors')}">
                                    <input type="text" maxlength="128" id="title" name="title" value="${fieldValue(bean:newsItemInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body">Body:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'body','errors')}">
                                    <textarea rows="5" cols="40" name="body">${fieldValue(bean:newsItemInstance, field:'body')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="allowComments">Allow Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'allowComments','errors')}">
                                    <g:checkBox name="allowComments" value="${newsItemInstance?.allowComments}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments">Comments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'comments','errors')}">
                                    
<ul>
<g:each var="c" in="${newsItemInstance?.comments?}">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="comment" params="['newsItem.id':newsItemInstance?.id]" action="create">Add Comment</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created">Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'created','errors')}">
                                    <g:datePicker name="created" value="${newsItemInstance?.created}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${newsItemInstance?.lastUpdated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags">Tags:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'tags','errors')}">
                                    
<ul>
<g:each var="t" in="${newsItemInstance?.tags?}">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="tag" params="['newsItem.id':newsItemInstance?.id]" action="create">Add Tag</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.auth.User.list()}" name="user.id" value="${newsItemInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>