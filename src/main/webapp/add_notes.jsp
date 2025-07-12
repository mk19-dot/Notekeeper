<%@page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Note</title>
    <%@include file="header.jsp"%>
</head>
<body>

<div class="container-fluid px-0">
    <%@include file="navbar.jsp"%>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="note-form">
                <h1>Add Your Note</h1>

                <form action="saveNote" method="post">
                    <div class="form-group mb-3">
                        <label for="noteTitle"><strong>Note Title</strong></label>
                        <input type="text" name="title" id="noteTitle" class="form-control" placeholder="Enter title" required />
                    </div>

                    <div class="form-group mb-4">
                        <label for="noteContent"><strong>Note Content</strong></label>
                        <textarea name="content" id="noteContent" class="form-control" placeholder="Enter your note..." required></textarea>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success btn-submit">Save Note</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
