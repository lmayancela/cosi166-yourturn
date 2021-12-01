console.log("Loading Modal")
$("#modal-window").find(".modal-content").html("<%= j (render 'display') %>");
$("#modal-window").modal();