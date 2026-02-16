---
title: "evTransFER: A Transfer Learning Framework for Event-based Facial Expression Recognition"
collection: publications
category: manuscripts
permalink: /publication/2026-16-01-evtransfer-1
excerpt: 'evTransFER: A Transfer Learning Framework for Event-based Facial Expression Recognition'
date: 2026-16-01
venue: 'Neurocomputing'
slidesurl: ''
paperurl: 'https://www.sciencedirect.com/science/article/abs/pii/S092523122600038X'
bibtexurl: 'http://rodrigo.verschae.org/files/bibtex/verschae2026evTransfer.bib'
citation: 'R Verschae, I. Bugueno-Cordova, “evTransFER: A Transfer Learning Framework for Event-based Facial Expression Recognition”, Neurocomputing, Volume 671, 28 March 2026, 132641'
---

Event-based cameras are bio-inspired sensors that asynchronously capture pixel intensity changes with microsecond latency, high temporal resolution, and high dynamic range, providing information on the spatiotemporal dynamics of a scene. We propose evTransFER, a transfer learning-based framework for facial expression recognition using event-based cameras. The main contribution is a feature extractor designed to encode facial spatiotemporal dynamics, built by training an adversarial generative method on facial reconstruction and transferring the encoder weights to the facial expression recognition system. We demonstrate that the proposed transfer learning method improves facial expression recognition compared to training a network from scratch. We propose an architecture that incorporates an LSTM to capture longer-term facial expression dynamics and introduces a new event-based representation called TIE. We evaluated the framework using both the synthetic event-based facial expression database e-CK+ and the real neuromorphic dataset NEFER. On e-CK+, evTransFER achieved a recognition rate of 93.6%, surpassing state-of-the-art methods. For NEFER, which comprises event sequences with real sensor noise and sparse activity, the proposed transfer learning strategy achieved an accuracy of up to 76.7%. In both datasets, the outcomes surpassed current methodologies and exceeded results when compared with models trained from scratch.
