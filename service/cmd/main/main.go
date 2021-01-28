package main

import (
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
	"github.com/malike/manifest/service/pkg/routes"
)

func main() {
	port := os.Getenv("API_PORT")
	if len(port) == 0 {
		log.Fatal("Failed to start. PORT not specified")
	}
	r := mux.NewRouter()
	routes.RegisterHealthRoutes(r)
	log.Printf("Starting server on the port %s", port)
	http.Handle("/", r)
	log.Fatal(http.ListenAndServe(":"+port, r))
}
