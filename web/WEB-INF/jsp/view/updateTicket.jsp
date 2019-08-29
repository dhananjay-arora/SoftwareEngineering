<%--@elvariable id="ticketId" type="java.lang.String"--%>
<%--@elvariable id="ticket" type="com.wrox.Ticket"--%>
<template:basic htmlTitle="Update a Ticket" bodyTitle="Update Ticket # ${ticketId}">
    <form method="POST" action="tickets" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="ticketId" value="${ticketId}"/>
        Subject<br />
        <input type="text" name="subject" value="${ticket.subject}" /><br /><br />
        Body<br />
        <textarea name="body" rows="5" cols="30"><c:out value="${ticket.body}" /></textarea><br /><br />

        <b>Attachments: </b><br />
      <c:if test="${ticket.numberOfAttachments > 0}">
        <c:forEach items="${ticket.attachments}" var="attachment"
        		varStatus="status">
            <c:if test="${!status.first}">, </c:if>
            <a href="<c:url value="/tickets">
                    <c:param name="action" value="download" />
                    <c:param name="ticketId" value="${ticketId}" />
                    <c:param name="attachment" value="${attachment.name}" />
                </c:url>"><c:out value="${attachment.name}" /></a>
        </c:forEach><br /><br />
        </c:if>  
    
        <br />
        <b>Add more attachments:</b><br />
        <input type="file" name="file1"/><br /><br />
        <input type="submit" value="Update"/>
    </form>
</template:basic>
