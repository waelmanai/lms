import { db } from "@/lib/db";
import { auth } from "@clerk/nextjs";
import { NextResponse } from "next/server";

export async function PUT(
    req: Request,
    { params }: { params: {courseId: string; chapterId: string} }
) {
    try {

        const { isCompleted } = await req.json();
        const { userId } = auth();
        
        if(!userId){
            return new NextResponse("Unauthorized", { status: 401 });
        }

        const userProgress = await db.userProgress.upsert({
            where: {
                userId_chapterId:{
                    userId,
                    chapterId: params.chapterId,
                }
            },
            update: {
                isCompleted
            },
            create: {
                userId,
                chapterId: params.chapterId,
                isCompleted
            }
        })

        return NextResponse.json(userProgress);

    } catch (error) {
        console.log("[CHAPTER_ID_PROGRES]", error);
        return new NextResponse("Internal Error", { status: 500 });
    }
}