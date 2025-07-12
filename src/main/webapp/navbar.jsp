<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
  <div class="container">
  <a class="navbar-brand fw-bold" href="index.jsp">
    <i class="fas fa-sticky-note"></i> NoteKeeper
  </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item <%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item <%= request.getRequestURI().contains("add_notes.jsp") ? "active" : "" %>">
          <a class="nav-link" href="add_notes.jsp">Add Note</a>
        </li>
        <li class="nav-item <%= request.getRequestURI().contains("allNotes.jsp") ? "active" : "" %>">
          <a class="nav-link" href="allNotes.jsp">Show Notes</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
