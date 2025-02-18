export interface IUser {
    id: string
    name: string
    password: string
    email: string
    role: string
    updated_at: string
    created_at: string
    avatar: any
}
export interface ILogin {
    name?: string
    email: string
    password: string
    avatar?: string,
    age?: number
}
export interface ISignUp {
    name: string
    email: string
    password: string
    avatar: string,
    age: number
}
export interface IAuthState {
    user: ILogin
    isLoggedIn?: boolean
    isAdmin: boolean,
    isCompany: boolean
}
export interface ISendMail {
    mailTo: string
    link: string
}
export interface IUpdate {
    name?: string
    avatar?: string
    age?: number
    email?: string
}
export interface IUpdateCompany {
    name?: string
    avatar?: string
    background?: string
    phone?: string
    numberEmployees?: number
    email?: string
    taxCode?: string
    address?: string
    linkWebsite?: string
    certificationDocuments?: string
}
export interface IJobTitle {
    job: string
}
export interface IResetPass {
    email: string
    exp: number
    iat: number
}





