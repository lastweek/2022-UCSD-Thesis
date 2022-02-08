TODO list for camera-ready or resubmission:
- `PM page allocation`: while changing page orders, which may involve multiple pages. This can be be recovered in face of failure.
- `Recovery code`: Many things can be recovered after crash. But we do not have the code to do recovery now. For example if failure happens in the middle of migration, we are able to recover, but we do not have the code to do so.
- `xact-cd in kernel`: the xact log is not persist. Solution: Use part of NVM as the logging space for xact-cd.
- `Everything in CD`: is not not persist and replicated. Shall we use ZooKeeper to make it reliable?
