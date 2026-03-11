# Animal Photos -- CI/CD Docker Deployment Project

##  Project Overview

This project demonstrates a complete CI/CD pipeline using:

-   Docker (containerization)
-   CircleCI (continuous integration & deployment)
-   Docker Hub (image registry)
-   Render (cloud hosting platform)
-   GitHub (source control)

The application is a simple static HTML photo gallery, but the focus of
this project is on implementing a real-world DevOps workflow.

------------------------------------------------------------------------

##  Live Demo

Production URL (update with your actual Render URL):

https://animal-photos.onrender.com



##  Application Details



##  Docker Setup

### Dockerfile

FROM nginx:alpine\
COPY index.html /usr/share/nginx/html/index.html\
COPY images/ /usr/share/nginx/html/images/\
EXPOSE 80

### What This Does

-   Uses lightweight nginx image
-   Copies static files into nginx web root
-   Exposes port 80
-   Serves the site through nginx

------------------------------------------------------------------------

##  CI/CD Workflow (CircleCI)

Branch-based deployment strategy:

### Feature Branch (feature/\*)

-   Builds Docker image
-   Does NOT push or deploy

### Main Branch (main)

-   Builds Docker image
-   Pushes image to Docker Hub
-   Triggers Render deployment via webhook

------------------------------------------------------------------------

##  CircleCI Configuration

Located at:

.circleci/config.yml

### Two Jobs

1️ build_only\
Triggered on feature branches\
Builds Docker image only.

2️ build_and_push\
Triggered only on main

Steps: 1. Build Docker image 2. Login to Docker Hub 3. Push image (SHA
tag + latest) 4. Trigger Render deploy hook

------------------------------------------------------------------------

##  Environment Variables (CircleCI)

Configured in:

Project Settings → Environment Variables

  Variable Name        Purpose
  -------------------- -------------------------
  DOCKERHUB_USERNAME   Docker Hub account
  DOCKERHUB_TOKEN      Docker Hub access token
  RENDER_DEPLOY_HOOK   Render webhook URL

These are securely stored and not committed to the repository.

------------------------------------------------------------------------

##  Deployment Flow

Feature branch push:

Developer → GitHub → CircleCI → Docker Build

Main branch merge:

Developer → GitHub → CircleCI\
→ Build Image\
→ Push to Docker Hub\
→ Trigger Render Webhook\
→ Render Pulls Latest Image\
→ Application Goes Live

This represents a complete CI/CD pipeline.

------------------------------------------------------------------------
------------------------------------------------------------------------

##  Concepts Demonstrated

-   Docker containerization
-   Remote Docker in CI
-   Secure environment variables
-   Branch-based CI workflows
-   Webhook-triggered deployment
-   Continuous Deployment (CD)
-   Git rebase vs merge
-   Production hosting of containerized app

------------------------------------------------------------------------


