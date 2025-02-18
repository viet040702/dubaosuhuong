export interface IJob {
    id: number
    title: string
    time: number
    city : string
    age : number
    sexual: string
    probationTime: string
    workWay: string
    right: string
    company: string
    job: string
    place: string
    numberEmployees: string
    experience: string
    level: string
    salary: string
    education: string
    description: string
    requirements: string
    deadline: string
    images: [any]
    link: string
    type: string
    contact: string
    marjor: string
}
export interface IJobUpdate {
    id: string
    Title?: string
    Company_Name?: string
    Time?: String
    City?: String
    Age?: string
    Sexual?: string
    Probation_Time?: string
    Work_Way?: string
    Right?: string
    Job?: string
    Place?: string
    Number_Employee?: string
    Experience?: string
    Level?: string
    Salary?: string
    Education?: string
    Description?: string
    Requirement?: string
    Deadline?: string
    Source_Picture?: string
}
export interface IPronvince {
    name: string
    code: number
}
export interface IPagination {
    data: IJob[],
    totalPages: number,
    currentPage: number,
    pageSize: number
}