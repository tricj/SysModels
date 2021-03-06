

module SysModels

    import Base.Collections.PriorityQueue, Base.Collections.peek, Base.Collections.dequeue!
    import Base.Order
    using DataStructures
    using JSON
    using Distributions

    const seconds = 1.0
    const minutes = 60seconds
    const hours = 60minutes
    const days = 24hours
    export seconds, minutes, hours, days

    const LOG_OFF = 0
    const LOG_MIN = 1
    const LOG_MAX = 10

    jsloglevel = LOG_OFF

    for x in [1:length(ARGS);]
        if ARGS[x] == "--jslog"
            jsloglevel = int(ARGS[x+1])
        end
    end

    abstract Resource

    include("vis/vis.jl")
    include("simulation.jl")
    include("process.jl")
    include("model.jl")
    include("agent.jl")
    include("location.jl")
    include("resources.jl")
    include("observation.jl")

    include("door.jl")
    include("choice.jl")



    export Simulation, Model, Resource, Process, Location, InputLocation, OutputLocation, Interface, Store
    export Agent, AgentData, get_data

    export link, enable_link, disable_link
    export move, claim, release, distrib, add, remove, find, flatten, get_store
    export start, hold, sleep, now, time_of_day
    export get_location, get_func, get_funcs, get_model
    export run, compose

    export @claim, ClaimTree, ClaimTreeNode

    export Door, access

    export choose, choose_stochastic

    #observation.jl
    export Event, ignore, handle!, handler, handled, observe, startevent, stopevent

    # js logging for traces
    export LOG_OFF, LOG_MIN, LOG_MAX, @jslog, jslog, jslog_init, jslog_end

    #export show

end
