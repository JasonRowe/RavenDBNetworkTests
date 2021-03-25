# RavenDB Network Tests
RavenDB cluster example using ToxiProxy to tamper with networking between nodes.

Get started by adding your license details to license.env.

Then execute 'run.ps1'. 

Once it is running you can go to the nodes directly via http://localhost:7071/, http://localhost:7072/, http://localhost:7073/. 

I have some examples scripts to add latency or disable a node. Then you can create documents on different nodes and see how RavenDB behaves. The idea is to use this to learn how to work with RavenDB when unexpected network or performance issues occure. 
