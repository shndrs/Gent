import UIKit

func exOne() {
    
    let semaphore = DispatchSemaphore(value: 1) // - value: the amount of threads we want to allow access to a shared resource at a given moment
    
    DispatchQueue.global().async {
        print("Kid 1 - wait")
        semaphore.wait()
        print("Kid 1 - wait finished")
        sleep(1) // Kid 1 playing with iPad
        semaphore.signal()
        print("Kid 1 - done with iPad")
    }
    
    DispatchQueue.global().async {
        print("Kid 2 - wait")
        semaphore.wait()
        print("Kid 2 - wait finished")
        sleep(1) // Kid 1 playing with iPad
        semaphore.signal()
        print("Kid 2 - done with iPad")
    }
    
    DispatchQueue.global().async {
        print("Kid 3 - wait")
        semaphore.wait()
        print("Kid 3 - wait finished")
        sleep(1) // Kid 1 playing with iPad
        semaphore.signal()
        print("Kid 3 - done with iPad")
    }
}

////////////////////////////////////////////////

/*  NEVER run semaphore wait() function on main thread as it will freeze your app. */

func exTwo() {
    let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 3)
    
    for i in 0..<15 {
        queue.async {
            let songNumber = i + 1
            semaphore.wait()
            print("Downloading song", songNumber)
            sleep(2) // Download take ~2 sec each
            print("Downloaded song", songNumber)
            semaphore.signal()
        }
    }
}

////////////////////////////////////////////////

func exThree() {
    print("starting long running tasks (2 at a time)")
    let sem = DispatchSemaphore(value: 2)            //this semaphore only allows 2 tasks to run at the same time (the resource count)
    for i in 0...7 {                                 //launch a bunch of tasks
        DispatchQueue.global().async {               //run tasks on a background thread
            sem.wait()                               //wait here if no resources available
            sleep(2)                                 //do some long task eg file access (here we are just sleeping for a 2 seconds for demonstration purposes)
            print("long task \(i) done! \(Date())")
            sem.signal()                             //let the semaphore know this resource is now available
        }
    }
}

//exOne()
//exTwo()
exThree()
