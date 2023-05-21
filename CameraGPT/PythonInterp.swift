//
//  PythonInterp.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/12/23.
//

import Foundation
import Python


func interp() {
    
    guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
    guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
    setenv("PYTHONHOME", stdLibPath, 1)
    setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
    Py_Initialize()
    // we now have a Python interpreter ready to be used
}
