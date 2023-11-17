import { 
    Card, 
    CardContent, 
    CardHeader, 
    CardTitle
} from "@/components/ui/card";
import { formatPrice } from "@/lib/format";


interface DataCardProps {
    value: number;
    label: string;
    shouldFormat?: boolean;
}

export const DataCard = ({
    value,
    label,
    shouldFormat
}: DataCardProps) => {
    return (
        <Card className="">
            <CardHeader className="flex flex-row items-center justify-between space-x-0 pb-2">
                <CardTitle className="text-sm font-medium">
                    {label}
                </CardTitle>
            </CardHeader>
            <CardContent>
                <div className="font-bold text-2xl">
                    {shouldFormat ? formatPrice(value) : value}
                </div>
            </CardContent>
        </Card>
    )
}