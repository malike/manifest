package routes

import (
	"github.com/gorilla/mux"
	"github.com/malike/manifest/service/pkg/controllers"
)

//RegisterHealthRoutes : Register health endpoints
var RegisterHealthRoutes = func(router *mux.Router) {

	// swagger:operation GET /health  GetHealth of Service
	// ---
	// summary: Return a ping response if service is active
	// description: Use this endpoint to check liveness and readiness of service
	// parameters:
	// responses:
	//   "200":
	//     "$ref": "#/responses/"
	router.HandleFunc("/health", controllers.GetHealth).Methods("GET", "OPTIONS")
}
